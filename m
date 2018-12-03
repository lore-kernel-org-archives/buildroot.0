From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 03 Dec 2018 22:53:00 +0100
Subject: [Buildroot] [PATCH 1/1] msgpack: disables tests
In-Reply-To: <20181125095025.7542-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 25 Nov 2018 10:50:25 +0100")
References: <20181125095025.7542-1-fontaine.fabrice@gmail.com>
Message-ID: <87efay46rn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > tests are enabled if gperf and zlib are found and they fail on:
 > /home/buildroot/autobuild/run/instance-0/output/build/msgpack-2.1.5/include/msgpack/v1/object.hpp:652:34:
 > error: 'void* memcpy(void*, const void*, size_t)' copying an object of non-trivial type 'struct msgpack::v2::object' from an array of 'const msgpack_object' {aka 'const struct msgpack_object'} [-Werror=class-memaccess]
 >      std::memcpy(&o, &v, sizeof(v));

 > So disable them.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/7d7aa9723f02f9bc78dbf6248674be4d402199bf

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2018.02.x and 2018.08.x, thanks.

-- 
Bye, Peter Korsgaard
