From: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
Date: Wed, 15 Jun 2016 23:30:46 +0200
Subject: [Buildroot] [PATCH 1/5] wireshark: remove documentation
In-Reply-To: <87shwfv8bh.fsf@dell.be.48ers.dk>
References: <20160614151017.GG3060@hermes.click-hack.org>
 <1465917079-30473-1-git-send-email-gilles.chanteperdrix@xenomai.org>
 <87shwfv8bh.fsf@dell.be.48ers.dk>
Message-ID: <20160615213046.GA23680@hermes.click-hack.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 14, 2016 at 10:12:18PM +0200, Peter Korsgaard wrote:
> >>>>> "Gilles" == Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org> writes:
> 
>  > Remove html and txt documentation from the rootfs as they unlikely to be
>  > needed.
> 
>  > Signed-off-by: Gilles Chanteperdrix <gilles.chanteperdrix@xenomai.org>
> 
> Committed, thanks.
> 
> usr/share/wireshark still contains >5MB of files, mainly xml and similar
> text files. Do you know if these are all needed?

No, no idea. The only problem I had was that the html documentation
made a non reproducible build.

-- 
					    Gilles.
https://click-hack.org
