From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 14 Mar 2012 19:20:32 +0100
Subject: [Buildroot] Added microblaze patch
In-Reply-To: <201203132335.46833.arnout@mind.be>
References: <CA+appbNdaSajXPdKk4OTyj0WOmeu=9PKr-Sa=cwAZNr76ujLnA@mail.gmail.com>
 <CAM+bi4spRA4CokbDkUPt-whT=35x8CqTKNxfT4EwV5Zk6Y3GCQ@mail.gmail.com>
 <4F5E3A6A.7010103@relinux.de> <201203132335.46833.arnout@mind.be>
Message-ID: <4F60E170.50002@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 13.03.2012 23:35, schrieb Arnout Vandecappelle:
> On Monday 12 March 2012 19:03:22 Stephan Hoffmann wrote:
>> I see, seems you are right. Now the download seems to work better. But
>> it loads a XML file. The URL wget tries to load is:
>>
>>  
>> http://git.xilinx.com/?p=xldk/microblaze_v2.0_le.git;a=blob;hb=HEAD;f=/microblazeel-unknown-linux-gnu.tgz
>>
>> This extra "/" in front of the filename seems to be the problem. In
>> fact, I don't know where it comes from;-(
>  Alvaro had patches that refactored the DOWNLOAD macro so the / was 
> removed.  Did you apply those patches?
No, I missed them.

Thank you

Stephan
>  Regards,
>  Arnout
>


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de
