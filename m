From: Ivan Kuten <ivan.kuten@promwad.com>
Date: Fri, 23 Nov 2007 17:31:20 +0200
Subject: [Buildroot] [PATCH] Add SUSv3 Legacy Macros config option
In-Reply-To: <200711231506.58719.atle@nissestad.no>
References: <200711231506.58719.atle@nissestad.no>
Message-ID: <4746F248.7070306@promwad.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Atle,

As I remember by previous discussion on mailing list the intention is totally
get rid of SUSV3_LEGACY_MACROS - that's why it is disabled by default.

As I understand correct solution is to fix those packages not to use deprecated functions.
Some packages already fixed this way - search for ***SUSV3.patch in packages/ - but not all.

Atle Nissestad wrote:
> Sorry if I'm a bit impatient, but could someone with commit-access add the 
> patch posted in this issue: http://busybox.net/bugs/view.php?id=1596 
> (http://bugs.uclibc.org/file_download.php?file_id=1193&type=bug)
> 
> ..or alternatively tell me to use a different approach to fix this issue...
> 
> - Atle
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot


Regards,
Ivan
-- 

--------------------------------
Embedded Linux engineer,
Promwad Company: http://www.promwad.com/
Homepage : http://www.ivankuten.com/
--------------------------------
