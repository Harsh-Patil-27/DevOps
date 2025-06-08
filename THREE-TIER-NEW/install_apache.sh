!/bin/bash

# Update package lists
apt update -y

# Install Apache2
apt install -y apache2

# Start and enable Apache2 service
systemctl start apache2
systemctl enable apache2

# Create detailed index.html page
cat > /var/www/html/index.html << 'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Terraform Three-Tier Architecture | Harsh Patil</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #1a2a6c, #2c3e50);
            color: #f0f0f0;
            min-height: 100vh;
            padding-bottom: 40px;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }

        header {
            text-align: center;
            padding: 40px 0;
            margin-bottom: 30px;
            background: rgba(0, 0, 0, 0.2);
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        h1 {
            font-size: 3.5rem;
            margin-bottom: 15px;
            background: linear-gradient(90deg, #00c9ff, #92fe9d);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .name {
            font-size: 1.8rem;
            color: #ffd700;
            font-weight: 600;
            margin-bottom: 25px;
        }

        .github-btn {
            display: inline-flex;
            align-items: center;
            padding: 12px 25px;
            background: linear-gradient(45deg, #24292e, #2d333b);
            color: white;
            text-decoration: none;
            border-radius: 50px;
            font-weight: 600;
            transition: all 0.3s ease;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.3);
            margin-top: 15px;
        }

        .github-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 7px 20px rgba(0, 0, 0, 0.4);
            background: linear-gradient(45deg, #2d333b, #24292e);
        }

        .github-btn i {
            margin-right: 10px;
            font-size: 1.3rem;
        }

        .section {
            background: rgba(30, 30, 40, 0.7);
            border-radius: 15px;
            padding: 30px;
            margin-bottom: 30px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.3);
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        h2 {
            font-size: 2rem;
            margin-bottom: 25px;
            color: #00c9ff;
            position: relative;
            padding-bottom: 10px;
        }

        h2:after {
            content: '';
            position: absolute;
            bottom: 0;
            left: 0;
            width: 70px;
            height: 4px;
            background: linear-gradient(90deg, #00c9ff, #92fe9d);
            border-radius: 2px;
        }

        p {
            line-height: 1.8;
            margin-bottom: 20px;
            font-size: 1.1rem;
        }

        .architecture {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 40px;
            margin-top: 40px;
        }

        .tier {
            width: 90%;
            padding: 25px;
            border-radius: 15px;
            background: rgba(40, 40, 60, 0.8);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
            transition: transform 0.3s ease;
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .tier:hover {
            transform: translateY(-10px);
        }

        .tier:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 6px;
            height: 100%;
        }

        .tier-1:before { background: linear-gradient(to bottom, #ff416c, #ff4b2b); }
        .tier-2:before { background: linear-gradient(to bottom, #00c9ff, #92fe9d); }
        .tier-3:before { background: linear-gradient(to bottom, #da22ff, #9733ee); }

        .tier h3 {
            font-size: 1.8rem;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
        }

        .tier h3 i {
            margin-right: 15px;
            font-size: 1.5rem;
        }

        .tier ul {
            padding-left: 25px;
        }

        .tier li {
            margin-bottom: 12px;
            line-height: 1.6;
        }

        .terraform-benefits {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            margin-top: 30px;
        }

        .benefit-card {
            background: rgba(50, 50, 70, 0.7);
            padding: 25px;
            border-radius: 12px;
            text-align: center;
            transition: transform 0.3s ease;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.1);
        }

        .benefit-card:hover {
            transform: translateY(-8px);
        }

        .benefit-card i {
            font-size: 3rem;
            margin-bottom: 20px;
            color: #00c9ff;
        }

        .benefit-card h4 {
            font-size: 1.4rem;
            margin-bottom: 15px;
            color: #92fe9d;
        }

        .code-snippet {
            background: #1e1e2e;
            border-radius: 8px;
            padding: 20px;
            margin: 20px 0;
            overflow-x: auto;
            font-family: 'Courier New', monospace;
            border: 1px solid #444;
        }

        .code-snippet code {
            color: #f8f8f2;
            font-size: 0.95rem;
        }

        .tech-stack {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            gap: 20px;
            margin-top: 30px;
        }

        .tech-item {
            text-align: center;
            width: 100px;
        }

        .tech-item i {
            font-size: 2.5rem;
            color: #00c9ff;
            margin-bottom: 10px;
        }

        @media (max-width: 768px) {
            h1 {
                font-size: 2.5rem;
            }
            
            .name {
                font-size: 1.5rem;
            }
            
            .section {
                padding: 20px;
            }
            
            .tier {
                width: 100%;
            }
            
            .terraform-benefits {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <header>
            <h1>Terraform Three-Tier Architecture</h1>
            <div class="name">Harsh Patil</div>
            <p>Infrastructure as Code with Terraform</p>
            <a href="https://github.com/Harsh-Patil-27/Devops/tree/main/THREE-TIER-NEW" class="github-btn" target="_blank">
                <i class="fab fa-github"></i> View on GitHub
            </a>
        </header>

        <section class="section">
            <h2>About Terraform</h2>
            <p>Terraform is an open-source infrastructure as code software tool created by HashiCorp. It enables users to define and provision data center infrastructure using a declarative configuration language known as HashiCorp Configuration Language (HCL).</p>
            <p>With Terraform, you can manage multiple cloud providers and on-premises resources with a unified workflow. Its key features include infrastructure lifecycle management, a resource graph for dependency resolution, and execution plans that show what actions will be taken before making changes.</p>
            
            <div class="terraform-benefits">
                <div class="benefit-card">
                    <i class="fas fa-code"></i>
                    <h4>Infrastructure as Code</h4>
                    <p>Infrastructure is described using a high-level configuration syntax.</p>
                </div>
                <div class="benefit-card">
                    <i class="fas fa-sync-alt"></i>
                    <h4>Execution Plans</h4>
                    <p>Terraform generates an execution plan describing what it will do to reach the desired state.</p>
                </div>
                <div class="benefit-card">
                    <i class="fas fa-network-wired"></i>
                    <h4>Resource Graph</h4>
                    <p>Terraform builds a graph of all resources and parallelizes creation and modification.</p>
                </div>
                <div class="benefit-card">
                    <i class="fas fa-history"></i>
                    <h4>Change Automation</h4>
                    <p>Complex changesets can be applied to infrastructure with minimal human interaction.</p>
                </div>
            </div>
        </section>

        <section class="section">
            <h2>Three-Tier Architecture Overview</h2>
            <p>This Terraform project implements a secure, scalable three-tier architecture on AWS with the following components:</p>
            
            <div class="architecture">
                <div class="tier tier-1">
                    <h3><i class="fas fa-globe-americas"></i> Web Tier</h3>
                    <ul>
                        <li>Public subnets with internet access</li>
                        <li>Application Load Balancer (ALB) for traffic distribution</li>
                        <li>Security groups allowing HTTP/HTTPS access</li>
                        <li>Auto-scaling group for EC2 instances</li>
                        <li>Route tables for public internet access</li>
                    </ul>
                    <div class="code-snippet">
                        <code># ALB Security Group<br>resource "aws_security_group" "alb_security_group" {<br>  name = "ALB Security Group"<br>  description = "Enable HTTP/HTTPS access on port 80/443"<br>  ...<br>}</code>
                    </div>
                </div>
                
                <div class="tier tier-2">
                    <h3><i class="fas fa-server"></i> Application Tier</h3>
                    <ul>
                        <li>Private subnets for application servers</li>
                        <li>Bastion host for SSH access (in private subnet)</li>
                        <li>Security groups allowing SSH from bastion host</li>
                        <li>NAT Gateway for outbound internet access</li>
                        <li>Route tables for private network routing</li>
                    </ul>
                    <div class="code-snippet">
                        <code># App Tier Security Group<br>resource "aws_security_group" "ssh_security_group" {<br>  name = "SSH Access"<br>  description = "Enable ssh access on port 22"<br>  ingress {<br>    cidr_blocks = [var.ssh_locate]<br>  }<br>}</code>
                    </div>
                </div>
                
                <div class="tier tier-3">
                    <h3><i class="fas fa-database"></i> Database Tier</h3>
                    <ul>
                        <li>Private subnets for database instances</li>
                        <li>Amazon RDS MySQL database</li>
                        <li>Security groups allowing access from application tier only</li>
                        <li>Multi-AZ deployment option</li>
                        <li>Database subnet group</li>
                    </ul>
                    <div class="code-snippet">
                        <code># RDS Instance<br>resource "aws_db_instance" "database_instance" {<br>  allocated_storage = 10<br>  engine = "mysql"<br>  instance_class = var.database_instance_class<br>  ...<br>}</code>
                    </div>
                </div>
            </div>
        </section>

        <section class="section">
            <h2>Technical Implementation</h2>
            <p>The Terraform configuration includes modular components for each part of the infrastructure:</p>
            
            <ul>
                <li><strong>VPC Configuration:</strong> Virtual Private Cloud with CIDR block 10.0.0.0/16</li>
                <li><strong>Subnets:</strong> Public web subnets, private app subnets, and private database subnets across two availability zones</li>
                <li><strong>Networking:</strong> Internet Gateway, NAT Gateway, and route tables for proper traffic routing</li>
                <li><strong>Security:</strong> Multiple security groups with least-privilege access rules</li>
                <li><strong>Compute:</strong> EC2 instances for web and application tiers</li>
                <li><strong>Database:</strong> Managed RDS MySQL instance for the data layer</li>
                <li><strong>Variables:</strong> Flexible configuration using Terraform variables</li>
            </ul>
            
            <div class="tech-stack">
                <div class="tech-item">
                    <i class="fab fa-aws"></i>
                    <p>AWS</p>
                </div>
                <div class="tech-item">
                    <i class="fas fa-cloud"></i>
                    <p>Terraform</p>
                </div>
                <div class="tech-item">
                    <i class="fas fa-shield-alt"></i>
                    <p>Security</p>
                </div>
                <div class="tech-item">
                    <i class="fas fa-network-wired"></i>
                    <p>Networking</p>
                </div>
                <div class="tech-item">
                    <i class="fas fa-database"></i>
                    <p>RDS</p>
                </div>
            </div>
        </section>

        <section class="section">
            <h2>Project Structure</h2>
            <p>The Terraform configuration is organized into logical files for better maintainability:</p>
            
            <div class="code-snippet">
                <code>├── ALB_SG.tf         # ALB Security Group<br>├── ALB.tf            # Application Load Balancer<br>├── APP_SG.tf         # Application Tier Security Group<br>├── DB_SG.tf          # Database Security Group<br>├── EC2.tf            # EC2 Instances<br>├── IGW.tf            # Internet Gateway<br>├── NAT_GATEWAY.tf    # NAT Gateway<br>├── RDS.tf            # Database Resources<br>├── ROUTE.tf          # Routing Tables<br>├── SUBNET.tf         # Subnet Configuration<br>├── VPC.tf            # VPC Configuration<br>├── WEB_SG.tf         # Web Tier Security Group<br>└── variable.tf       # Terraform Variables</code>
            </div>
        </section>
    </div>

    <script>
        // Simple animation for tier cards
        document.addEventListener('DOMContentLoaded', function() {
            const tiers = document.querySelectorAll('.tier');
            
            tiers.forEach(tier => {
                tier.addEventListener('mouseenter', function() {
                    this.style.zIndex = '10';
                });
                
                tier.addEventListener('mouseleave', function() {
                    this.style.zIndex = '1';
                });
            });
        });
    </script>
</body>
</html>
EOF

# Set proper permissions
chown -R www-data:www-data /var/www/html/
chmod -R 755 /var/www/html/
