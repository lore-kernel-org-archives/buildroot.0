From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 11 May 2017 23:26:09 +0200
Subject: [Buildroot] [PATCH v2 1/4] fix help text wrapping for configs a
In-Reply-To: <20170505140808.17696-1-aduskett@codeblue.com>
References: <20170505140808.17696-1-aduskett@codeblue.com>
Message-ID: <20170511232609.2a2de639@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri,  5 May 2017 10:08:05 -0400, Adam Duskett wrote:
> The check-package script when ran gives warnings on text wrapping
> on all of these Config files.  This patch cleans up all warnings
> related to the text wrapping for the Config files starting with
> the letter a in the package directory.
> 
> The appropriate indentation is: <tab><2 spaces><62 chars>
> See http://nightly.buildroot.org/#writing-rules-config-in for more
> information.
> 
> Signed-off-by: Adam Duskett <aduskett@codeblue.com>
> ---
> v1 -> v2:
>   - Increase margins.  Margins were set too low in the origin patch.

Applied to next, thanks. However, for future patches, please use this
title:

  package/a*/Config.in: fix help text wrapping

Obviously adjusting 'a*' with the appropriate letter :)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
