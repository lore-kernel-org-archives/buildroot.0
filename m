From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 29 Dec 2010 19:02:56 -0300
Subject: [Buildroot] [PATCH 00/10] Toolchain rework, take 3
In-Reply-To: <87d3okjno4.fsf@macbook.be.48ers.dk>
References: <1293563435-10054-1-git-send-email-gustavo@zacarias.com.ar>	<87y679j8md.fsf@macbook.be.48ers.dk>	<4D1B9D5F.4090901@zacarias.com.ar>
	<87d3okjno4.fsf@macbook.be.48ers.dk>
Message-ID: <4D1BB010.8060007@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/29/2010 06:04 PM, Peter Korsgaard wrote:

> Thanks, but we're down to 6 patches now so it's no loner a ton ;)
> 
> I see that you are still hiding the BR2_PACKAGE_BINUTILS option, why is that?

Force and habit.
Users shouldn't need to select it by hand since it's just libbfd, on the
other hand hiding it isn't so nice.
I'll unhide it.
