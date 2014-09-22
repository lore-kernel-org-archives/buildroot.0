From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 22 Sep 2014 21:56:13 +0200
Subject: [Buildroot] [PATCH 06/23 v5] docs/manual: copying the manual
 sources is a common action
In-Reply-To: <9b1aced8dc64c58749753d3c797ff24064a66fc9.1410692670.git.yann.morin.1998@free.fr>
References: <cover.1410692670.git.yann.morin.1998@free.fr>
 <9b1aced8dc64c58749753d3c797ff24064a66fc9.1410692670.git.yann.morin.1998@free.fr>
Message-ID: <CAHXCMM+7A4DH+maDvkazFZMP9CzNLOFNtKWBKdfUPkoC7aemsA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Sep 14, 2014 at 1:07 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> Move the creation of $(BUILD_DIR)/manual and the rsyncing of the
> sources into GENDOC.
>
> This is is needed so that GENDOC can be easily used to generate another
> document, without requiring that document to duplicate the copying rules.
>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

-- 
Samuel
