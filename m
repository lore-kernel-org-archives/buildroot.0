From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 04 Dec 2012 11:12:34 -0800
Subject: [Buildroot] Buildroot and Jamvm
In-Reply-To: <CAH8HgbzkfN9RJWRC-32u+qJxyanNgt6b=Us64QkzzTJaWVQgyA@mail.gmail.com>
 (alain mouflet's message of "Sat, 24 Nov 2012 21:33:40 +0100")
References: <CAH8HgbzkfN9RJWRC-32u+qJxyanNgt6b=Us64QkzzTJaWVQgyA@mail.gmail.com>
Message-ID: <87d2ypocm5.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "alain" == alain mouflet <alain.mouflet@gmail.com> writes:

Hi,

 alain> I have downloaded Buildroot to use with a calao board. The
 alain> 2012.08 version is without jamvm and I need this soft.  I tought
 alain> that is simple to add it and I did it : I took java path in a
 alain> last version (2010.08), I have copied this directory on the new
 alain> buildroot pakages. I have modified the config.in file to get the
 alain> choice with "make menuconfig" and it's ok but never classpath
 alain> and jamvm are downloaded. No message about classpath or jamvm
 alain> appears in the build.log This way is good ? I made a mistake
 alain> somewhere or may be it's impossible to get jamvm with the new
 alain> buildroot ?

Some of the buildroot infrastructure has changed a bit since 2010.08, so
that's probably why. I have just re-added jamvm + classpath to buildroot
git, so it would be good if you could give it a test.

I've done several test builds and tried to run a simple hello world
program, but nothing major.

For git access, see:

http://buildroot.net/git.html

-- 
Bye, Peter Korsgaard
