From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Thu, 18 Mar 2021 14:38:43 +0000
Subject: [Buildroot] [PATCH 1/1] configs/freescale_imx8mpevk: new
 defconfig
In-Reply-To: <YFNhecIx/Ddrc5sc@p1g2>
References: <20210318135335.31898-1-stephane.viau@oss.nxp.com>
 <AM0PR04MB6946BE1F498EC348A0C373F3A7699@AM0PR04MB6946.eurprd04.prod.outlook.com>,
 <YFNhecIx/Ddrc5sc@p1g2>
Message-ID: <AM0PR04MB6946DB2C2E1C9A98A1A667BAA7699@AM0PR04MB6946.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi  Gary,                                                                        
                                                                                 
Thanks for your feedback.                                                        
                                                                                 
>                                                                                
>Hi Stephane,                                                                    
>                                                                                
>Thanks for this, I've been looking forward 8MP support in Buildroot!            
>                                                                                
>On Thu, Mar 18, 2021 at 02:01:41PM +0000, Stephane Viau (OSS) wrote:            
>> >This patch adds support for the NXP i.MX 8MPlus EVK board [1].               
>> >                                                                             
>> >The final boot image is created from uboot and firmware binaries in post     
>> >image script board/freescale/common/imx/imx8-bootloader-prepare.sh           
>> >                                                                             
>> >This first support is based on NXP's 5.4.70_2.3.0 BSP.                       
>> >                                                                             
>> >[1] https://www.nxp.com/design/development-boards/i-mx-evaluation-and-development-boards/evaluation-kit-for-the-i-mx-8m-plus-applications-processor:8MPLUSLPD4-EVK
>> >                                                                             
>> >Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>                     
>> >---                                                                          
>>                                                                               
>>     [Stephane: tested on i.MX8MP EVK]                                         
>>     Tested-by: Stephane Viau <stephane.viau@oss.nxp.com>                      
>                                                                                
>However, can you split your patch? It changes many files/packages which         
>aren't related to the NXP EVK but the i.MX 8M Plus support in general.          
>                                                                                
>You can have a look at my Nano series [1] for comparison.                       
                                                                                 
Will do.                                                                         
                                                                                 
BR,                                                                              
Stephane.                                                                        
                                                                                 
>                                                                                
>Regards,                                                                        
>Gary                                                                            
>                                                                                
>[1] http://patchwork.ozlabs.org/project/buildroot/list/?series=170477&archive=both&state=*
