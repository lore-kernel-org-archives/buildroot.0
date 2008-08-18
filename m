From: Mikael Sundberg <micke@oddjob.se>
Date: Mon, 18 Aug 2008 16:09:47 +0200
Subject: [Buildroot] undefined reference to `__ctype_tolower_loc'
Message-ID: <48A982AB.7040106@oddjob.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi again,

When trying to compile gettext-0.16.1 i get:
../intl/.libs/libintl.so: undefined reference to `__ctype_tolower_loc'
../intl/.libs/libintl.so: undefined reference to `__ctype_b_loc'

I dont know where to start looking... Is this related to the locale 
support?

thanks,
Mikael Sundberg
