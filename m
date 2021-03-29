From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Mar 2021 22:14:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/libglib2: security bump to
 version 2.66.8
In-Reply-To: <20210321131508.1141933-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 21 Mar 2021 14:15:08 +0100")
References: <20210321131508.1141933-1-fontaine.fabrice@gmail.com>
Message-ID: <87mtulemyv.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix a security issue when using g_file_replace() with
 > G_FILE_CREATE_REPLACE_DESTINATION

 > https://gitlab.gnome.org/GNOME/glib/-/tags/2.66.8

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x, thanks.

Doesn't look immediately obvious to backport to 2.62.x / 2.64.x.

-- 
Bye, Peter Korsgaard
