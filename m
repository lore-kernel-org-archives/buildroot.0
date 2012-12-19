From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Wed, 19 Dec 2012 17:34:29 +0100 (CET)
Subject: [Buildroot] [PATCH 2/4] gstreamer: port to gstreamer-1.0
In-Reply-To: <1355936324-9585-2-git-send-email-bogdan@nimblex.org>
References: <1355936324-9585-1-git-send-email-bogdan@nimblex.org>
 <1355936324-9585-2-git-send-email-bogdan@nimblex.org>
Message-ID: <1565829996.1426028.1355934869325.JavaMail.root@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bogdan Radulescu,

On Wednesday, December 19, 2012 5:58:42 PM, Bogdan Radulescu wrote:
> From: Bogdan Radulescu <bogdan@nimblex.net>
> 
> Initial commit of updated gstreamer + plugins which compile
> 
> Signed-off-by: Bogdan Radulescu <bogdan@nimblex.net>

Some environments are not yet gst-1.0-ready, especially for network streaming.
Wouldn't it be useful, at least for some time, to have the choice between 0.10,
1.0, or both (they can be installed side by side without any conflict)?

Best regards,
Beno?t
