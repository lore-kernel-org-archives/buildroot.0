From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 11 Feb 2013 13:49:46 +0100
Subject: [Buildroot] [PATCH 1/1] openpgm: new package
In-Reply-To: <20130211134547.02bedae4@skate>
References: <1360585826-17996-1-git-send-email-alexander.lukichev@gmail.com>
 <20130211134547.02bedae4@skate>
Message-ID: <201302111349.46451.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Alexander, All,

On Monday 11 February 2013 13:45:47 Thomas Petazzoni wrote:
> On Mon, 11 Feb 2013 14:30:26 +0200, Alexander Lukichev wrote:
[--SNIP--)
> > +OPENPGM_AUTORECONF = YES
> 
> Since the source code comes as a tarball, it's uncommon to have to do
> an autoreconf. Could you add a comment right before this line that
> explains why it is needed?

Because the patch touches configure.ac.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +0/33 662376056 | Software  Designer | \ / CAMPAIGN     |   ^                |
| --==< O_o >==-- '------------.-------:  X  AGAINST      |  /e\  There is no  |
| http://ymorin.is-a-geek.org/ | (*_*) | / \ HTML MAIL    |  """  conspiracy.  |
'------------------------------'-------'------------------'--------------------'
