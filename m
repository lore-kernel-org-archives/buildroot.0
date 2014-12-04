From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 Dec 2014 16:56:03 +0100
Subject: [Buildroot] valgrind issues on 2014.11-git buildroot
In-Reply-To: <CANPyyuOxMHdc_ivhhQecBbJUzpJi5gqtAj_CJVhKWNLh0akwZw@mail.gmail.com>
References: <CABzetm3pRytRnxuGTG6wUvrTYvG4BzYj-AvhKx3wNytDFRW9dQ@mail.gmail.com>
 <CANPyyuPLsjAT=tzJqKZiTzm1_62B9Kv_yEgxMx+fY40oKUk1Cg@mail.gmail.com>
 <CABzetm1a-XBngGm0g7Q__u2J3wS-MqyRGW61C9Q76ck+GLTAiA@mail.gmail.com>
 <CANPyyuOxMHdc_ivhhQecBbJUzpJi5gqtAj_CJVhKWNLh0akwZw@mail.gmail.com>
Message-ID: <20141204165603.0129b7b3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Mike Williams,

On Thu, 4 Dec 2014 10:40:45 -0500, Mike Williams wrote:

> I would say yes. I'm not certain of it in this case, but I usually
> make clean when changing options like this. See:
> http://buildroot.uclibc.org/downloads/manual/manual.html#full-rebuild

I can confirm you need to do a make clean. Basically, once Buildroot
has stripped binaries in output/target, the only sane way to get back to
unstripped binaries is to do a full clean build.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
