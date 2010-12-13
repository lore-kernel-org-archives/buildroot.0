From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Mon, 13 Dec 2010 20:47:02 +0100
Subject: [Buildroot] [PATCH 04/14] toolchain: remove toolchain-specific
	stripping
In-Reply-To: <1fd847785df3843e906c143c04528f4f1fef0a77.1292257643.git.thomas.petazzoni@free-electrons.com>
References: <cover.1292257643.git.thomas.petazzoni@free-electrons.com>
	<1fd847785df3843e906c143c04528f4f1fef0a77.1292257643.git.thomas.petazzoni@free-electrons.com>
Message-ID: <201012132047.02977.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday 13 December 2010 17:27:40 Thomas Petazzoni wrote:
> We already handle the stripping of libraries in $(TARGET_DIR) at the
> global level, so there's no need to have toolchain-specific option and
> code for this.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
