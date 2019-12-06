From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 06 Dec 2019 10:01:14 +0100
Subject: [Buildroot] [PATCH 1/2] package/python-gobject: depend on
 python2
In-Reply-To: <20191201030656.3691270-1-aduskett@gmail.com> (aduskett's message
 of "Sat, 30 Nov 2019 19:06:55 -0800")
References: <20191201030656.3691270-1-aduskett@gmail.com>
Message-ID: <87immtn7z9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Version 2.86.6 of python-gobject is quite old and no longer works with
 > Python versions > 3.7. When importing a user will recieve the following error:

 > Traceback (most recent call last):
 >   File "<stdin>", line 1, in <module>
 >   File "/usr/lib/python3.8/site-packages/gobject/__init__.py", line 26, in
 >   <module>
 >   File "/usr/lib/python3.8/site-packages/glib/__init__.py", line 22, in <module>
 > SystemError: initialization of _glib raised unreported exception

 > Because new versions of python-gobject require gobject-introspection, which is
 > not currently available in Buildroot, add a dependency on python2 to prevent
 > users from receiving the above error.

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>

Committed to 2019.11.x, thanks.

-- 
Bye, Peter Korsgaard
