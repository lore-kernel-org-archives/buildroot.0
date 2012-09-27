From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 27 Sep 2012 19:27:06 -0300
Subject: [Buildroot] [PATCHv2 4/4] iw: pkg-config nitpicking
In-Reply-To: <5064C7E6.3080005@mind.be>
References: <1348656522-13698-1-git-send-email-gustavo@zacarias.com.ar>
 <1348656522-13698-4-git-send-email-gustavo@zacarias.com.ar>
 <5064C7E6.3080005@mind.be>
Message-ID: <5064D2BA.4050102@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/27/12 18:40, Arnout Vandecappelle wrote:
> Doesn't removing GIT_DIR break version.sh?

Oh yes it does on dirty, my bad for being to 'dd' happy.
I'll resend the whole set once it's decided what to do about pkg-config.
IMHO host-pkg-config can be killed with fire, no need to duplicate it.
pkg-config might be deprecated as per the usual rite, though it's
duplicate functionality and could be just killed being a piggy with glib
deps :)
Regards.
