From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 22:13:43 +0200
Subject: [Buildroot] [PATCH] mpir: new package
In-Reply-To: <1492114114.644630127@f341.i.mail.ru>
References: <mpir:> <1492091374-5028-1-git-send-email-semenak94@mail.ru>
 <20170413215959.6e221b3e@free-electrons.com>
 <1492114114.644630127@f341.i.mail.ru>
Message-ID: <20170413221343.3ee0a005@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Please keep the Buildroot mailing list in Cc, thanks!

On Thu, 13 Apr 2017 23:08:34 +0300, Semen Kolganov wrote:

> I just forgot about DEVELOPER file.:-)?Should I resend you a new
> patch?
>
> Well, about host, I thought, that it can be usefull to have this
> library on host, when you don't need in your target, but only for
> building.

We don't want to needlessly add host packages. So either the host
package is needed as a build dependency of another package or directly
useful for some specific use case, otherwise we simply don't want to
have a host variant.

So we never add a host variant "just because".

Could you resend after dropping the host variant and adding the change
to the DEVELOPERS file?

Make sure to run support/scripts/check-package on your package.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
