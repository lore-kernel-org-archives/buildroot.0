From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2020 11:31:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/memcached: bump to version 1.6.7
In-Reply-To: <20201003082556.3007179-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 3 Oct 2020 10:25:56 +0200")
References: <20201003082556.3007179-1-fontaine.fabrice@gmail.com>
Message-ID: <87tuvatk0e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > - Drop patches (already in version) and so autoreconf
 > - Update indentation in hash file (two spaces)

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

I see that 1.5.20 added a security fix and 1.5.22 fixed a crash issue
introduced in 1.5.22. It would be good if you could also send a patch
bumping from 1.5.19 to 1.5.22 for 2020.02.x / 2020.05.x / 2020.08.x:

https://github.com/memcached/memcached/wiki/ReleaseNotes

-- 
Bye, Peter Korsgaard
