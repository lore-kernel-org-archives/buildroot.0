From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 23 Feb 2016 17:53:36 +0100
Subject: [Buildroot] pjsip package status
In-Reply-To: <841623823.459573.1456179714125.JavaMail.zimbra@savoirfairelinux.com>
References: <1914178697.329791.1455739489770.JavaMail.zimbra@savoirfairelinux.com>
 <20160220173543.GE3418@free.fr>
 <841623823.459573.1456179714125.JavaMail.zimbra@savoirfairelinux.com>
Message-ID: <56CC8E90.4070507@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Patrick,

On 22/02/2016 23:21, Patrick Keroulas wrote:
> Yann,
> 
> Sure I can take a look at this but my BR experience is quite limited.
> Not sure about gsm, srtp, and portaudio. Why aren't they treated like
> other options? Are you sure they're necessary for Asterisk application?
> I thought configure options should limit the package footprint as much
> as possible.

I recently revived my interest in the pjsip package, and planned to
adopt that patch and resubmit it pretty soon. If you prefer you can just
wait a couple days for my submission. I'll Cc: you anyway so you can
have a look and give your comments.

Mine will be a very minimal support, no optional stuff enabled.

-- 
Luca
