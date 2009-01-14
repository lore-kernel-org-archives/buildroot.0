From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 14 Jan 2009 20:25:26 +0000
Subject: [Buildroot] error building alsa-utils
Message-ID: <496E4A36.4050902@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All,

I have just checked out the trunk and am doing an ARM build with alsa-utils.

Have run into a couple of problems. The first is that it does not compile with 
SUSV3_LEGACY disabled due to the use of index & rindex. Have a patch that fixes that.

The second problem I have is it appears to be trying to install the manual pages and is 
failing when trying to use xmlto command. I want to configure it to not build/install the 
man pages but I can't spot a configure option to do so. Am I missing something obvious? If 
not how do you suggest fixing this?

Thanks,

Will.
-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Development Manager                      Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
