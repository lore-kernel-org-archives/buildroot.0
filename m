From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 01 Oct 2019 23:41:26 +0200
Subject: [Buildroot] [PATCH v2 2019.02.x] libglib2: fix compilation with
 gcc9
In-Reply-To: <3b50879d-f266-633b-34fd-6ca40909308c@orolia.com> ("Julien
 =?utf-8?Q?B=C3=A9raud=22's?= message of "Tue, 1 Oct 2019 14:09:35 +0000")
References: <20190920131636.9492-1-julien.beraud@orolia.com>
 <3b50879d-f266-633b-34fd-6ca40909308c@orolia.com>
Message-ID: <87sgocxhx5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Julien" == Julien B?raud <julien.beraud@orolia.com> writes:

 > On 20/09/2019 15:17, Julien B?raud wrote:
 >> fix compilation of host-libglib2 with gcc9 by backporting :
 >> https://gitlab.gnome.org/GNOME/glib/merge_requests/626
 >> 
 >> v1 -> v2 : Fixed patch file name
 >> 
 >> Signed-off-by: Julien Beraud <julien.beraud@orolia.com>
 >> ---
 >> .../0006-Avoid-printing-null-strings.patch    | 71 +++++++++++++++++++

 > My mistake, patch already present on this branch. Sorry for the noise.

Ok, I have marked it as not applicable in patchwork.

-- 
Bye, Peter Korsgaard
