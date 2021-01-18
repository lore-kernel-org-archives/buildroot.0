From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Mon, 18 Jan 2021 10:26:27 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Your daily results for
 2021-01-15
In-Reply-To: <6fdd08ad-8de6-464b-a7b2-47c9cbedad77@HE1EUR01FT006.eop-EUR01.prod.protection.outlook.com>
References: <6fdd08ad-8de6-464b-a7b2-47c9cbedad77@HE1EUR01FT006.eop-EUR01.prod.protection.outlook.com>
Message-ID: <PA4PR04MB7920C4990EEA59953B4C3C4DA7A40@PA4PR04MB7920.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>________________________________________                                        
>From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>                           
>Sent: Saturday, January 16, 2021 8:18 AM                                        
>To: Stephane Viau (OSS)                                                         
>Subject: [autobuild.buildroot.net] Your daily results for 2021-01-15            
>                                                                                
>Hello,                                                                          
>                                                                                
>Gitlab CI failures                                                              
>==================                                                              
>                                                                                
>Below is a list of Gitlab CI job failures in relation to defconfigs             
>or runtime tests you are in charge of. Please help us                           
>improving the quality of Buildroot by investigating                             
>those build failures and sending patches to fix                                 
>them.Thanks!                                                                    
>                                                                                
>Results for 'master'                                                            
>--------------------                                                            
>                                                                                
>Build failures related to your defconfigs:                                      
>                                                                                
>                        defconfig |                        link to the job      
>----------------------------------+--------------------------------------------------------------
>              freescale_imx8mnevk |  https://gitlab.com/buildroot.org/buildroot/-/jobs/962451205
>                                                                                
                                                                                 
Hello Thomas, Yann,                                                              
                                                                                 
Today, none of the freescale_imx* defconfig build on master.                     
                                                                                 
A git bisect blames commit 5b95a5dc2 ("support/download: change format of        
archives generated from git"), introduced by Yann on January 10th.               
                                                                                 
Any idea whether someone is looking into these failures?                         
                                                                                 
BR,                                                                              
Stephane.                                                                        
                                                                                 
>                                                                                
>                                                                                
>--                                                                              
>http://autobuild.buildroot.net                                                  
