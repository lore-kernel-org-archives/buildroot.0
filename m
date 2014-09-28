From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 28 Sep 2014 21:44:36 +0200
Subject: [Buildroot] [PATCH v2] glm: Added package
In-Reply-To: <1408123178-6202-1-git-send-email-paul@crapouillou.net> (Paul
 Cercueil's message of "Fri, 15 Aug 2014 19:19:38 +0200")
References: <1408123178-6202-1-git-send-email-paul@crapouillou.net>
Message-ID: <87k34nv8bf.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Paul" == Paul Cercueil <paul@crapouillou.net> writes:

 > OpenGL Mathematics (GLM) is a header only C++ mathematics library for
 > graphics software based on the OpenGL Shading Language (GLSL)
 > specification.

 > http://glm.g-truc.net/

From that description I thought it needed the opengl headers, but I've
checked and it doesn't (and the website states that as well).

Committed, thanks.

-- 
Bye, Peter Korsgaard
