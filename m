From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 12 Jan 2021 22:04:43 +0100
Subject: [Buildroot] Host tar 1.32 build issues
In-Reply-To: <CAGt4E5uAjxt=oPGqzqN7OEGbGbv68DqKq+xE2KntB_wQoeo2Ew@mail.gmail.com>
References: <CAGt4E5srq1hg4T1YoKX9UUCTJ96DdnNL1XFrYvsgpWjM_KM1EA@mail.gmail.com>
 <95c3b23f-6805-e526-8bc2-a0d48a66895c@mind.be>
 <20210112091905.GA382149@scaer>
 <dad432a5-a41c-efed-ef6c-1b41fcee8819@mind.be>
 <CAGt4E5uAjxt=oPGqzqN7OEGbGbv68DqKq+xE2KntB_wQoeo2Ew@mail.gmail.com>
Message-ID: <20210112210443.GZ3044608@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Markus, Arnout, All,

On 2021-01-12 10:23 -0800, Markus Mayer spake thusly:
> The two CPIO archives are on the GNU server now. I asked about it on
> the GNU tar mailing list last night (my time), and Sergey was so kind
> to upload the two missing CPIO archives.
> 
> https://lists.gnu.org/archive/html/bug-tar/2021-01/msg00006.html
> 
> So everything is in place now.

There was still the update to the hash file that was missing. I've now
fixed it.

Thank you for noticing the issue and reporting so promptly! :-)

Now, tar 1.33 is out, care to send an update? ;-]

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
