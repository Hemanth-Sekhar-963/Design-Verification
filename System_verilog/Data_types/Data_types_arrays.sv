module array_examples;

  // *** 1. Packed and Unpacked Arrays ***
  bit [3:0] packed_array;           
  int unpacked_array[3];            

  // *** 2. Multi-dimensional Arrays ***
  int multi_dim_array[2][3];        
  int multi_dim_packed [1:0][2:0];  

  // *** 3. Dynamic Arrays ***
  int dynamic_array[];

  // *** 4. Associative Arrays ***
  int assoc_array[int];              
  string word_count[string];         

  // *** 5. Queues ***
  int queue[$];

  // *** 6. Array Methods Example ***
  int method_array[];
  
  // *** 7. Slicing Example ***
  int sliced_array[];

  // *** 8. Reduction Operations ***
  int sum, product;

  // *** 9. Array of Structures ***
  typedef struct {
    int id;
    string name;
  } employee_t;
  employee_t employees[3];

  // *** 10. Array of Arrays (Jagged Arrays) ***
  int jagged_array[3][];

  // *** 11. Random Arrays ***
  int random_array[5]; // Removed 'rand' keyword

  // *** 12. Array of Enums ***
  typedef enum {RED, GREEN, BLUE} color_t;
  color_t colors[3];

  initial begin
    // *******************************
    // *** 1. Packed & Unpacked Arrays ***
    // *******************************
    packed_array = 4'b1010;
    $display("Packed Array: %b", packed_array);

    unpacked_array = '{10, 20, 30};
    $display("Unpacked Array: %0d, %0d, %0d", unpacked_array[0], unpacked_array[1], unpacked_array[2]);

    // *******************************
    // *** 2. Multi-dimensional Arrays ***
    // *******************************
    multi_dim_array = '{'{1, 2, 3}, '{4, 5, 6}};
    foreach (multi_dim_array[i, j])
      $display("multi_dim_array[%0d][%0d] = %0d", i, j, multi_dim_array[i][j]);

    multi_dim_packed = '{'{1, 2, 3}, '{4, 5, 6}};
    $display("Multi-Dimensional Packed Array: %p", multi_dim_packed);

    // *******************************
    // *** 3. Dynamic Arrays ***
    // *******************************
    dynamic_array = new[5]; 
    foreach (dynamic_array[i]) dynamic_array[i] = i * 10;
    $display("Dynamic Array: %p", dynamic_array);

    dynamic_array = new[3]; 
    $display("Resized Dynamic Array: %p", dynamic_array);

    // *******************************
    // *** 4. Associative Arrays ***
    // *******************************
    assoc_array[1] = 100;
    assoc_array[2] = 200;
    $display("Associative Array: Key 1 = %0d, Key 2 = %0d", assoc_array[1], assoc_array[2]);

    if (assoc_array.exists(2))
      $display("Key '2' exists in associative array.");

    word_count["hello"] = "world";
    word_count["foo"] = "bar";
    $display("String-based Associative Array: hello -> %s, foo -> %s", word_count["hello"], word_count["foo"]);

    // *******************************
    // *** 5. Queues ***
    // *******************************
    queue = {1, 2, 3, 4, 5}; 
    $display("Queue before pop: %p", queue);

    queue.pop_front(); 
    $display("Queue after pop_front: %p", queue);

    queue.push_back(6); 
    $display("Queue after push_back: %p", queue);

    queue.insert(1, 99);
    $display("Queue after insert: %p", queue);

    queue.delete(2);
    $display("Queue after delete: %p", queue);

    // *******************************
    // *** 6. Array Methods ***
    // *******************************
    method_array = new[5]('{10, 20, 30, 40, 50}); 
    $display("Array Size: %0d", method_array.size());

    method_array.shuffle();
    $display("Shuffled Array: %p", method_array);

    method_array.reverse();
    $display("Reversed Array: %p", method_array);

    method_array.sort();
    $display("Sorted Array: %p", method_array);

    method_array = method_array.find with (item > 20);
    $display("Filtered Array (Items > 20): %p", method_array);

    // *******************************
    // *** 7. Slicing ***
    // *******************************
    sliced_array = method_array[1:3];
    $display("Sliced Array: %p", sliced_array);

    // *******************************
    // *** 8. Array Reduction Operations ***
    // *******************************
    sum = method_array.sum();
    product = method_array.product();
    $display("Sum of Elements: %0d", sum);
    $display("Product of Elements: %0d", product);

    // *******************************
    // *** 9. Array of Structures ***
    // *******************************
    employees = '{'{1, "Alice"}, '{2, "Bob"}, '{3, "Charlie"}};
    foreach (employees[i])
      $display("Employee %0d: ID = %0d, Name = %s", i, employees[i].id, employees[i].name);

    // *******************************
    // *** 10. Array of Arrays (Jagged Arrays) ***
    // *******************************
    jagged_array[0] = new[2]('{1, 2});
    jagged_array[1] = new[3]('{3, 4, 5});
    jagged_array[2] = new[1]('{6});
    foreach (jagged_array[i, j])
      $display("jagged_array[%0d][%0d] = %0d", i, j, jagged_array[i][j]);

    // *******************************
    // *** 11. Random Arrays ***
    // *******************************
    foreach (random_array[i])
      random_array[i] = $urandom_range(1, 100); // Random values between 1 and 100
    $display("Randomized Array: %p", random_array);

    // *******************************
    // *** 12. Array of Enums ***
    // *******************************
    colors = '{RED, GREEN, BLUE};
    foreach (colors[i])
      $display("Color %0d: %s", i, colors[i].name());
  end

endmodule
