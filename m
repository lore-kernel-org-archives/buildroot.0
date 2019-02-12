From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 12 Feb 2019 20:15:59 +0100
Subject: [Buildroot] [PATCH v2,4/4] package/mongodb: new package
In-Reply-To: <20190210142619.8207-4-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 10 Feb 2019 15:26:19 +0100")
References: <20190210142619.8207-1-fontaine.fabrice@gmail.com>
 <20190210142619.8207-4-fontaine.fabrice@gmail.com>
Message-ID: <87h8d8u8b4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Here is the list of the changes compared to removed mongodb 3.3.4
 > version:
 > - Remove patch (not applicable anymore)
 > - Add patch (sent upstream) to fix openssl build with gcc 7 and
 >   -fpermissive
 > - Remove 32 bits x86 platforms, removed since version 3.4:
 >   https://docs.mongodb.com/manual/installation/#supported-platforms
 > - Change license: since October 2018, license is SSPL:
 >   - https://www.mongodb.com/community/licensing
 >   - https://jira.mongodb.org/browse/SERVER-38767
 > - gcc must be at least 5.3 so add a dependency on gcc >= 6
 > - Add a dependency on host-python-xxx modules:
 >   https://github.com/mongodb/mongo/blob/r4.0.6/docs/building.md
 > - Use system versions of boost, pcre, snappy, sqlite, yaml-cpp and zlib
 >   instead of embedded mongodb ones
 > - Add hash for license files

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Thomas Petazzoni and Yann E. Morin):
 >  - Do not revert "mongodb: remove package"
 >  - Move all mongodb related changes to a single "mongodb: new package"

Committed, thanks. Thanks for taking over the package!

-- 
Bye, Peter Korsgaard
