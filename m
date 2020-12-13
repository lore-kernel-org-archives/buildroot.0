From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 13 Dec 2020 11:09:15 +0100
Subject: [Buildroot] [PATCH v1 01/31] package/qt5: bump version to 5.15.2
In-Reply-To: <20201121211258.12068-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Sat, 21 Nov 2020 22:12:28 +0100")
References: <20201121211258.12068-1-ps.report@gmx.net>
Message-ID: <87im96yq44.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > qt5base:
 >   - header.BSD was remove with commit 'Remove license header
 >     templates from qtbase' ([1])

 > qt5tools:
 >   - rebase 0001-Disable-designer-tool-fixes-configure-error.patch

 > qt5webengine:
 >   - update 3rdparty license info

 > [1] https://code.qt.io/cgit/qt/qtbase.git/commit/?id=9ac8b9c92eb01bf755995669ecd7ab3acf21dd7d

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Is there a list of fixes somewhere? Should this be backported to
2020.11.x?

-- 
Bye, Peter Korsgaard
