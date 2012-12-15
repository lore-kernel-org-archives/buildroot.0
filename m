From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 15 Dec 2012 08:46:41 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-12-14
In-Reply-To: <87ip83hc85.fsf@dell.be.48ers.dk>
References: <20121215073441.8B91F52C104@lolut.humanoidz.org>
 <87ip83hc85.fsf@dell.be.48ers.dk>
Message-ID: <50CC6321.7020404@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/15/2012 06:54 AM, Peter Korsgaard wrote:

> This looks to be caused by the gettext bump. Gustavo, any ideas?

Arcane gettext used as aclocal.m4 source in gd.
Patch sent.
Regards.
