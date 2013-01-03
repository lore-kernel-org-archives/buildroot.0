From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Jan 2013 19:08:07 +0100
Subject: [Buildroot] [RFC] How to handle targets that need more than one
	file system to boot?
In-Reply-To: <CAEYzJUFB5qbQBguXNoux=kqMHhqpj0pKDFhBi6j0FHAF7QU8Mw@mail.gmail.com>
References: <201212240100.17473.yann.morin.1998@free.fr>
 <201301031833.44543.yann.morin.1998@free.fr>
 <CAEYzJUFB5qbQBguXNoux=kqMHhqpj0pKDFhBi6j0FHAF7QU8Mw@mail.gmail.com>
Message-ID: <201301031908.07247.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bj?rn, All,

On Thursday 03 January 2013 Bj?rn Forsman wrote:
> On 3 January 2013 18:33, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
[--SNIP--]
> > As for ext4, it is probably not possible, as it is really different from
> > an ext2/3 filesystem.
> 
> You can also convert ext3 to ext4:
> 
> https://ext4.wiki.kernel.org/index.php/Ext4_Howto#Converting_an_ext3_filesystem_to_ext4

Ah, good to know! Thank you! :-)
So, we now know how to generate filesystems for all the ext familly. Yeah!

Regarfds,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
