From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 23 Sep 2014 13:42:56 -0300
Subject: [Buildroot] [PATCH 3/3] libgtk3: new package
In-Reply-To: <54219E85.6020906@imgtec.com>
References: <1411489271-26899-1-git-send-email-eric.le.bihan.dev@free.fr>
 <1411489271-26899-4-git-send-email-eric.le.bihan.dev@free.fr>
 <54219E85.6020906@imgtec.com>
Message-ID: <5421A310.2020905@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/23/2014 01:23 PM, Vicente Olivert Riera wrote:

> Since you are planing to add a new package, why not use the latests
> version of it? 3.14.0

Probably because it needs a libglib2, atk, cairo and whatnot bump as well.
And since it was just released in this case in particular i'd go for
safe so as to get this in sooner rather than later - the bump can be a
new patchset afterwards.
Regards.
