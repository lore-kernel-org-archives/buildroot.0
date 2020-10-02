From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 02 Oct 2020 10:48:56 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/pkg-meson.mk: fix generation
 of pkg_config_static prop
In-Reply-To: <20200915100546.806157-1-nolange79@gmail.com> (Norbert Lange's
 message of "Tue, 15 Sep 2020 12:05:43 +0200")
References: <20200915100546.806157-1-nolange79@gmail.com>
Message-ID: <871rih2etj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Norbert" == Norbert Lange <nolange79@gmail.com> writes:

 > fixes following in the generated cross-complation.conf file:
 > pkg_config_static = '$(if $(BR2_STATIC_LIBS),true,false)'

 > Signed-off-by: Norbert Lange <nolange79@gmail.com>

Committed to 2020.02.x, 2020.05.x and 2020.08.x, thanks.

-- 
Bye, Peter Korsgaard
