From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Sun, 26 Jun 2016 13:07:21 +0200
Subject: [Buildroot] Patchwork cleanup week #24
In-Reply-To: <20160615220634.67eb8fa9@free-electrons.com>
References: <20160615220634.67eb8fa9@free-electrons.com>
Message-ID: <1466939241.32055.6.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mi, 2016-06-15 at 22:06 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> The previous patchwork cleanup period being over, it's time to start
> the second period, with 10 other patches. We're on June 15th, so I'll
> give people until June 30th to react on the following patches. If
> there's no reaction, like no interest from either the original
> submitter nor any other Buildroot developer, the patch will be marked
> Rejected on June 30th.
> 
> If you are in To: of this e-mail, then one or several of the patches
> below have been authored by you, so you should be interested :-)
> 
> 
> ?8. new package: alsacap
> ????http://patchwork.ozlabs.org/patch/607045/
> 
> ????Isn't there already a tool in alsa-utils that does the same thing
> ????more or less?

I guess you mean 'alsa-info' [1]. It's a shell script which does not
run within Busybox.

[1]?http://www.alsa-project.org/alsa-info.sh

J?rg
