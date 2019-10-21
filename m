From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 21 Oct 2019 19:13:28 +0200
Subject: [Buildroot] [PATCH 1/2] package/python-entrypoints: new package
In-Reply-To: <20191021134031.20586-4-asafka7@gmail.com>
References: <20191021134031.20586-1-asafka7@gmail.com>
 <20191021134031.20586-4-asafka7@gmail.com>
Message-ID: <20191021191328.201217a0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Asaf,

On Mon, 21 Oct 2019 16:40:24 +0300
Asaf Kahlon <asafka7@gmail.com> wrote:

> Signed-off-by: Asaf Kahlon <asafka7@gmail.com>

Could you send the patches that go together, at the same time ? Here I
had a long list of patches PATCH 1/1, and in the middle of them, this
PATCH 1/2, which I guess goes with "package/python-keyring: bump to
version  19.2.0". Having them sent separately is quite confusing.

Could you make sure to send series as proper series, this would really
makes things a bit easier.

Also, I see you are doing a lot of version bumps for Python packages.
Is it related to the fact that you know receive e-mail notifications
when Python packages are not up to date ? Are we going to see a point
where this stream of patches reduces, or is there just very frequent
update of Python modules happening upstream ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
