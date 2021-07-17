From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Jul 2021 12:47:40 +0200
Subject: [Buildroot] [PATCH v2 1/1] {linux,
 linux-headers}: bump 5.13 to 5.13.2
In-Reply-To: <CADvTj4oUWPyQjasnxgfiGyWK4krMTb6y2bq1N3gwb-XciZK8RQ@mail.gmail.com>
References: <20210716010020.3295725-1-james.hilliard1@gmail.com>
 <20210716230952.38662412@windsurf>
 <CADvTj4oUWPyQjasnxgfiGyWK4krMTb6y2bq1N3gwb-XciZK8RQ@mail.gmail.com>
Message-ID: <20210717124740.09cd503a@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 17 Jul 2021 04:01:08 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Isn't that just a symlink?
> $ ls -laht package/linux-headers/linux-headers.hash
> lrwxrwxrwx 1 buildroot buildroot 22 Feb 24  2019
> package/linux-headers/linux-headers.hash -> ../../linux/linux.hash

Meh, indeed. My bad, sorry for incorrectly reviewing your patch. I'll
apply it. Sorry again :/

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
