From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 13 Mar 2018 22:37:02 +0100
Subject: [Buildroot] [PATCH v3 5/7] support/dockerfile: install flake8
In-Reply-To: <1520910585-19097-6-git-send-email-ricardo.martincoski@gmail.com>
 (Ricardo Martincoski's message of "Tue, 13 Mar 2018 00:09:43 -0300")
References: <1520910585-19097-1-git-send-email-ricardo.martincoski@gmail.com>
 <1520910585-19097-6-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <87woyfirnl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ricardo" == Ricardo Martincoski <ricardo.martincoski@gmail.com> writes:

 > Use the latest version of the tool because it is actively maintained.
 > But use a fixed version of the tool and its dependencies to get stable
 > results. It can be manually bumped from time to time.

 > Before installing any Python packages, ensure pip, setuptools, and wheel
 > are up to date as recommended in the docs [1].

 > [1] https://packaging.python.org/tutorials/installing-packages/

 > Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>
 > ---
 > Changes v2 -> v3:  (suggested by Yann E. MORIN)
 >   - minimise the number of intermediate layers;
 >   - explain why install setuptools separately using the latest version
 >     (I actually just used the exact command line from the docs and
 >     referenced it in the commit log);
 >   - use a single package on each line, sorted.

 > Changes v1 -> v2:  (suggested by Yann E. MORIN)
 >   - install flake8 to the base docker image instead of adding sudo to
 >     install tools on the fly.

Committed, thanks.

-- 
Bye, Peter Korsgaard
