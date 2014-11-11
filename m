From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 11 Nov 2014 18:26:41 -0300
Subject: [Buildroot] [PATCH] aircrack-ng: security bump to version
	1.2-rc1
In-Reply-To: <87d28tmnwz.fsf@dell.be.48ers.dk>
References: <1415734946-3492-1-git-send-email-gustavo@zacarias.com.ar>	<87bnodo5p9.fsf@dell.be.48ers.dk>
 <54627093.3050103@zacarias.com.ar> <87d28tmnwz.fsf@dell.be.48ers.dk>
Message-ID: <54627F11.8090409@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/11/2014 06:23 PM, Peter Korsgaard wrote:

> I don't think we need to spend a lot of effort on building something
> like this statically if upstream doesn't really support it. I wouldn't
> have any problems with making it depend on !STATIC.

aircrack-ng upstream has been receptive of my patch(es) so far and the
problem lies with libnl*.pc to be precise which doesn't define
Libs.private at all even though it uses libm and libpthread for example.
I just need some time and will to fix that in a proper way.
On aircrack's side it uses pkg-config so it's mostly clean.
Regards.
