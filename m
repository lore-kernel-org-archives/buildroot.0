From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 17 Feb 2020 10:12:24 +0100
Subject: [Buildroot] [PATCH 1/2] support/run-tests: reorder imports
In-Reply-To: <CAGm1_ktNXE41xmTqVb5vBbJvZJ2sik0XZ9f8wxEg9iDVTs=53w@mail.gmail.com>
 (Yegor Yefremov's message of "Mon, 17 Feb 2020 09:10:08 +0100")
References: <20200213100906.11506-1-yegorslists@googlemail.com>
 <87eeuufvg8.fsf@dell.be.48ers.dk>
 <CAGm1_ktU8-WuO=93jBRts7TExzJ=NbZYKO0QzbzWuthQYuaAqQ@mail.gmail.com>
 <87r1ytd4kd.fsf@dell.be.48ers.dk>
 <CAGm1_ktNXE41xmTqVb5vBbJvZJ2sik0XZ9f8wxEg9iDVTs=53w@mail.gmail.com>
Message-ID: <87imk5d1c7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:

 > On Mon, Feb 17, 2020 at 9:02 AM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> 
 >> >>>>> "Yegor" == Yegor Yefremov <yegorslists@googlemail.com> writes:
 >> 
 >> > Hi Peter,
 >> > On Sun, Feb 16, 2020 at 3:39 PM Peter Korsgaard <peter@korsgaard.com> wrote:
 >> >>
 >> >> >>>>> "yegorslists" == yegorslists  <yegorslists@googlemail.com> writes:
 >> >>
 >> >> > From: Yegor Yefremov <yegorslists@googlemail.com>
 >> >> > Reorder imports using the isort utility.
 >> >>
 >> >> Why? Does the current order cause any issues or warnings from linters?
 >> 
 >> > I get this warning:
 >> 
 >> > wrong-import-order: standard import "import multiprocessing" should be
 >> > placed before "import nose2"
 >> 
 >> Ok, From what checker do you get this warning?

 > pylint3 support/testing/run-tests

Ok, committed with that added to the commit message, thanks.

-- 
Bye, Peter Korsgaard
