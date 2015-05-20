From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 19 May 2015 21:00:36 -0700
Subject: [Buildroot] [PATCH 5/6] php: bump version to 5.6.9
In-Reply-To: <87oalg4an8.fsf@dell.be.48ers.dk>
References: <1431978724-25081-1-git-send-email-bos@je-eigen-domein.nl>
 <1431978724-25081-5-git-send-email-bos@je-eigen-domein.nl>
 <87oalg4an8.fsf@dell.be.48ers.dk>
Message-ID: <555C06E4.9070409@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19/05/15 12:42, Peter Korsgaard wrote:

> Anything critical in this version bump? E.G. should we include this for
> the 2015.05 release?

https://bugs.php.net/bug.php?id=69418
There's a CVE regression in there, so from me for 2015.05:

Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
