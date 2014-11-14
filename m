From: =?UTF-8?Q?K=C3=A1roly_Kasza?= <kaszak@gmail.com>
Date: Fri, 14 Nov 2014 14:49:47 +0100
Subject: [Buildroot] [PATCH 05/10] start-stop-daemon: new package
In-Reply-To: <546606AE.8010902@zacarias.com.ar>
References: <1415969096-3032-1-git-send-email-gustavo@zacarias.com.ar>
 <1415969096-3032-6-git-send-email-gustavo@zacarias.com.ar>
 <CABbD_XDZaMY5-zvMrc25PuwWQZKwfyft+7CjQrhp5cCUj7xjOA@mail.gmail.com>
 <546606AE.8010902@zacarias.com.ar>
Message-ID: <CABbD_XB7mCc-CdEQKd7Pt0r18_p73yhXYxJewWssyt0w4fjhzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>
> I'm building inside lib/compat/ and utils/ later for the bare minimum,
> which 7 binaries are you talking about?


You are right, I overlooked that. I tested outside buildroot, and it always
built dpkg-deb, split & five others in src. This of course not happening if
you only build in lib/compat & utils.

Best regards,
Karoly
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20141114/5c4e91e9/attachment.html>
