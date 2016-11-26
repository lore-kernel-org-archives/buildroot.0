From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Nov 2016 15:02:51 +0100
Subject: [Buildroot] [PATCH] package/pseudo: update version
In-Reply-To: <d0e8798c-0d61-663c-5293-99f64806e3a7@mind.be>
References: <20161125212248.3540-1-gael.portay@savoirfairelinux.com>
 <d0e8798c-0d61-663c-5293-99f64806e3a7@mind.be>
Message-ID: <20161126150251.4373c78a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 26 Nov 2016 11:50:45 +0100, Arnout Vandecappelle wrote:

> >  package/pseudo/pseudo-wrapper | 2 +-
> >  package/pseudo/pseudo.mk      | 2 +-  
> 
>  Did you test this? You didn't update the hash file...

Hash files are not checked for git downloads, so it can work without
updating the hash. Since the git download helper was fixed to generate
reproducible archives, we haven't (yet) enabled hash checking for
git downloads.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
