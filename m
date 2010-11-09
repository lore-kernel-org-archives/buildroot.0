From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 09 Nov 2010 13:43:05 -0300
Subject: [Buildroot] ping: Sparc Leon patches
In-Reply-To: <4CD80E7E.9020708@gaisler.com>
References: <4CD80E7E.9020708@gaisler.com>
Message-ID: <4CD97A19.4020900@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/08/10 11:51, Konrad Eisele wrote:

> patches follow

Tested and added to my repo so it probably will be in for 2010.11 as
discussed with Thomas on IRC.
One problem i've found is that when i build for a v7 target (doesn't
matter if it's leon or generic) libgomp in gcc seems to fail badly, is
it known?
And do you have patches for other versions of gcc like 4.3.x or 4.5.x to
include in the future?
Thanks.
