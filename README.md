# Low-Cost Open-Source Photobioreactor Design for Microalgae Research

## Project Overview

This project presents a cost-effective, modular, and open-source photobioreactor (PBR) system designed for budget-constrained academic institutions, particularly in developing regions.  This design aims to democratize access to microalgae research, empowering students and researchers to explore the potential of algae in diverse applications, including biofuel production, carbon sequestration, and the production of nutritional supplements.

## Project Goals

* **Democratize Algae Research:** Provide an accessible and affordable photobioreactor system for institutions with limited budgets.
* **Enable Hands-on Learning:** Equip students with practical skills in algae cultivation and bioprocessing, bridging the gap between theoretical knowledge and real-world applications.
* **Facilitate Advanced Research:** Allow researchers to conduct various microalgae-related studies in a controlled laboratory environment.
* **Scalability and Flexibility:**  Develop a system that can be adapted for both small-scale academic experiments and larger research trials, maintaining precise control over key variables.

## Technical Design Overview

The photobioreactor system features a modular design, combining readily available and affordable components to achieve optimal algae cultivation:

**1. Main Structure:**

* **Acrylic Tubes:** Two 1-meter long, transparent acrylic tubes with an internal diameter of 76 mm and an outer diameter of 82 mm serve as the primary cultivation chambers.
* **Elbows:** Four 90° sanitary elbows (75 mm outer diameter) facilitate media addition, air input, and output, creating a closed-loop system to minimize contamination and optimize growth conditions.
* **Total Volume:** The system holds approximately 11.36 liters (10.56 liters from the acrylic tubes and 0.8 liters from the elbows).

**2. Input/Output Connections:**

* **Top Left Elbow:** Media input for nutrient delivery via the media pump.
* **Top Right Elbow:**  Excess air outlet to vent surplus air during aeration.
* **Bottom Left Elbow:** Air input from the aerator pump to maintain optimal oxygen levels and agitate the media.
* **Bottom Right Elbow:** Media extraction via the harvest pump for periodic removal of cultivated microalgae.
* **Connectors:** Pneumatic connectors (8 mm x 1/4" BSP Male Thread) ensure airtight seals and prevent leaks at critical connections.
* **Valves:**  
    * A one-way valve on the air input line prevents backflow into the aerator.
    * A one-way valve on the harvest pump output prevents reverse flow during media extraction.

**3. Pump System:**

* **Aerator Pump:**  Delivers a consistent flow of air into the system, promoting algae growth by maintaining optimal oxygen levels.
* **Harvest Pump:**  Periodically removes algae-laden media for collection and processing.
* **Media Pump:**  Delivers fresh nutrient media to replenish depleted nutrients and maintain optimal growth conditions.

**4. Support Structure:**

* **Base:** A stable wooden platform (16 inches x 16 inches, 1.2 cm thick) provides support for the pipes and pumps.
* **PVC Supports:** Large PVC pipes (90 mm) serve as vertical supports for holding the structure in place.
* **Threaded Rods:**  Threaded rods with nuts and bolts securely attach the pipes to the base, ensuring stability during operation.
* **Rubber Stoppers:**  Corner-mounted stoppers prevent slipping or movement during operation.

**5. Air and Media Management:**

* **Air Input:**  Controlled by the aerator pump, entering through the bottom left elbow, with a one-way valve maintaining airtightness.
* **Air Output:** Excess air is vented through the top right elbow to prevent pressure buildup.
* **Media Input:** Fresh nutrient media is supplied by the media pump through the top left connector.
* **Media Harvest:** The harvest pump periodically extracts algae-laden media from the bottom right connector for processing.

**6. Electrical System:**

* **Control Unit:**
    * **Microcontroller:**  An Arduino UNO+WiFi R3 with an ESP8266 module for wireless control and data logging.
    * **Power Supply:** A 12V power supply shared between the microcontroller and MOSFET modules.
* **MOSFET Drivers:** Four IRF520 MOSFET modules control:
    * **LED Lighting:**  Simulates sunlight for optimal algae growth.
    * **Aerator Pump:** Provides consistent oxygen supply.
    * **Media Pump:**  Delivers nutrient media.
    * **Harvest Pump:**  Triggers periodic algae extraction.

**7. Sensor System:**

* **Turbidity Sensor:** Monitors algae concentration in the medium.  Triggers the harvest pump when the concentration reaches a pre-set threshold (e.g., 500), ensuring optimal growth conditions are maintained.

**8. System Volume and Design Features:**

* **Volume:** Approximately 11.36 liters (9.08 liters per pipe).
* **Key Features:**
    * **Closed-loop design:**  Minimizes contamination and provides precise control over environmental variables.
    * **Modular design:**  Allows for easy cleaning and part replacement.
    * **Automation:**  Sensors and MOSFET modules control pumps and lighting for efficient operation.
    * **Stability:** The support structure ensures long-term stability.

**Use Cases and Applications:**

* **Biofuel Research:** Cultivate microalgae for biofuel production, a promising renewable and sustainable alternative to fossil fuels.
* **Carbon Sequestration:** Study algae's role in mitigating climate change through carbon dioxide capture and conversion to biomass.
* **Nutritional Supplements:** Cultivate algae strains for the production of protein-rich supplements and health foods.

**Cost Estimate:**

This design prioritizes affordability by using readily available and often low-cost components.  The estimated cost for building this research-grade photobioreactor (excluding tools and potential additional costs) is in the range of **₹10,600.00 - ₹17,100.00**.

**Future Iterations:**

The design can be further enhanced with additional features, such as:

* **CO2 and O2 Dissolved Sensors:**  Monitor carbon dioxide and oxygen levels in the media for more accurate control and understanding of algal metabolism.
* **Temperature Sensor:**  Maintain a stable temperature for optimal algal growth. 
* **pH Sensor:**  Maintain the optimal pH range for your algae species. 
* **Advanced Control Algorithms:**  Implement machine learning algorithms to analyze data and predict optimal settings for light, aeration, and nutrient levels. 

**Conclusion:**

This open-source photobioreactor design empowers low-budget academic institutions to conduct advanced microalgae research. Its cost-effectiveness, modularity, and automation features make it an ideal solution for institutions seeking to explore the potential of microalgae in various applications. By adopting affordable components and open-source technology, this project encourages innovation and fosters practical solutions to global challenges like climate change and sustainable energy production.

**Contributing:**

We encourage your participation in this open-source project!  Here's how you can contribute:

* **Report Issues:**  Find a bug or have a suggestion?  Open an issue on the GitHub repository.
* **Improve Documentation:**  Help make the documentation even better!
* **Submit Code:**  Contribute code to add new features, fix bugs, or improve the existing system.

**License:**

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

**Contact:**

If you have any questions or want to contribute, please contact: rsuyashcontact@gmail.com

---
