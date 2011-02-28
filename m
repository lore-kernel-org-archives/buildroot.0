From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 28 Feb 2011 09:58:23 +0100
Subject: [Buildroot] Question about buildroot generated toolchain
	binaries
In-Reply-To: <AANLkTik50wEG+D=pUFuAihFdD7XnjPwHUOQ80dY0RP7a@mail.gmail.com>
References: <AANLkTikLie3Zj9hqYV=BvGEN+efJm0_eVKWbc-66L3wt@mail.gmail.com>
	<AANLkTin5E0ig9oa0m-=L-xd-eg-QoeA9xOREO2mwBYEP@mail.gmail.com>
	<AANLkTik50wEG+D=pUFuAihFdD7XnjPwHUOQ80dY0RP7a@mail.gmail.com>
Message-ID: <201102280958.23215.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Charles, Steve, All,

On Monday 28 February 2011 011304 Charles Krinke wrote:
> Hmmm. Well perhaps a "ls -l" might shed more light as the printout below
> shows two entries with the same size which are probably the same file.
> 
> I would suspect that one is a softlink to the other.

Hard links, they shall be. The size of symlinks is the length od the path
of the pointed-to file. To check, use 'ls -li' to see the inode number.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
