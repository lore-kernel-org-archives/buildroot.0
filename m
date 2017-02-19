From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 19 Feb 2017 07:40:19 +0200
Subject: [Buildroot] CHIP Pro OS?
In-Reply-To: <c2ae5f05-3a98-49db-b8f7-42b5ae37fe0d@Spark>
References: <c2ae5f05-3a98-49db-b8f7-42b5ae37fe0d@Spark>
Message-ID: <20170219054019.2pithfjy3yw4ujxg@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Josh,

On Sat, Feb 18, 2017 at 09:03:30PM -0700, jjman04 at icloud.com wrote:
> Hi guys, I'm Josh. I wasn't sure which email to sent to, so I sent to both 
> of the email addresses that I found.

Please use the buildroot@ address only.

> Here's my question:
> 
> How hard would it be for me to program a (very lean) OS for CHIP Pro 
> (https://getchip.com/pages/chippro) using Buildroot?

Buildroot is not about programming new OSes. It builds existing OS kernels 
(only the Linux kernel is currently supported) and some other software 
packages to something you can run on various boards. If you are into OS 
development check http://wiki.osdev.org/Main_Page.

> Keep in mind that I'm only 12, so I don't know many programming languages. I 
> know a bit of Python and HTML5. I'm also learning C++ as soon as I find an 
> online course. Would knowing those languages be enough?

Python, HTML and C++ are not so good for OS development since their 
implementations depend on OS provided services. You need something like C,
Rust, or assembly.

You also need a very good understanding of your target hardware. This kind of 
information is unfortunately not so easy to come by when dealing with 
Allwinner based products like the CHIP Pro.

Good luck,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
