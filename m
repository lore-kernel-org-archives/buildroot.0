From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Apr 2018 16:28:20 +0200
Subject: [Buildroot] [v5 05/11] pkg-generic: add a subdirectory to the
 DL_DIR
In-Reply-To: <20180402130934.19274-5-maxime.hadjinlian@gmail.com> (Maxime
 Hadjinlian's message of "Mon, 2 Apr 2018 15:09:28 +0200")
References: <20180402130934.19274-1-maxime.hadjinlian@gmail.com>
 <20180402130934.19274-5-maxime.hadjinlian@gmail.com>
Message-ID: <87a7uln0mz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:

 > With all the previous changes, we are now ready to add a subdirectory to
 > the DL_DIR.
 > The structure will now be DL_DIR/PKG_NAME/{FILE1,FILE2}

 > This is needed for multiple reasons:
 >     - Avoid patches with name like SHA1.patch laying flat in DL_DIR,
 >     which makes it hard to know to which packages they apply
 >     - Avoid possible collisions if two releases have the same name
 >     (e.g: v01.tar)
 >     - Allow the possibility to handle a git cache per package in the
 >     newly created subdirectory.

 > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
 > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
