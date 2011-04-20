From: John Smith <jf15190@yahoo.com>
Date: Wed, 20 Apr 2011 12:48:12 +0100 (BST)
Subject: [Buildroot] creating skeleton during build
Message-ID: <264719.62934.qm@web132207.mail.ird.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

--- On Tue, 19/4/11, Patryk Benderz <Patryk.Benderz@esp.pl> wrote:

>>[cut]
>> build. Any way to avoid this?
>Maybe try to make fresh build and let BR populate it's own skeleton.
>After that overwrite 'target' directory with your skeleton. AFAIK BR
>doesn't bother to validate 'target' dir after first build. At least
>until 2011-03-31 snapshot.

Yes, that is the obvious thing to do, and what I wanted to do, but I could not see a way of getting control early enough (before the libs are copied in) Please do remember this is gcc3_legacy (a very old version) I'm talking about here.
The modern post build script idea is also another possibility, but it still boils down to getting control at the right moment in the build sequence.
