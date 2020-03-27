From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 23:33:17 +0100
Subject: [Buildroot] [PATCH 1/1] linux-tools: perf: Add dependencies for
 binutils and openssl
In-Reply-To: <20200302224934.1356690-1-hancock@sedsystems.ca> (Robert
 Hancock's message of "Mon, 2 Mar 2020 16:49:34 -0600")
References: <20200302224934.1356690-1-hancock@sedsystems.ca>
Message-ID: <87tv29e8cy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Robert" == Robert Hancock <hancock@sedsystems.ca> writes:

 > perf auto-detects and uses the libbfd (from binutils) and openssl
 > libraries if they are detected and happen to be built before perf is,
 > but if they're not, or if per-package directories are enabled, it won't
 > detect these libraries. Explicitly add dependencies on these packages if
 > they are enabled, and disable the feature if not, so that the behavior
 > is deterministic.

 > Signed-off-by: Robert Hancock <hancock@sedsystems.ca>

Committed to 2019.02.x, 2019.11.x and 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard
