From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 23:34:07 +0200
Subject: [Buildroot] [PATCH v2 2/4] fix help text wrapping for configs b
In-Reply-To: <20170505140808.17696-2-aduskett@codeblue.com>
References: <20170505140808.17696-1-aduskett@codeblue.com>
 <20170505140808.17696-2-aduskett@codeblue.com>
Message-ID: <20170511233407.0645ecbd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 May 2017 10:08:06 -0400, Adam Duskett wrote:
> The check-package script when ran gives warnings on text wrapping
> on all of these Config files.  This patch cleans up all warnings
> related to the text wrapping for the Config files starting with
> the letter b in the package directory.
> 
> The appropriate indentation is: <tab><2 spaces><62 chars>
> See http://nightly.buildroot.org/#writing-rules-config-in for more
> information.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> ---
> v1 -> v2:
>   - Added patch to series.

I've also applied patches 2, 3 and 4 to our next branch.

Besides the commit title, please also review your patches for trailing
white spaces. Your patches were adding a few of them here and there.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
