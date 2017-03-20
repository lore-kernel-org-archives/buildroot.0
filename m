From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Mar 2017 16:05:18 +0100
Subject: [Buildroot] [PATCH v2 1/2] leptonica: new package
In-Reply-To: <1489910873-8450-2-git-send-email-gilles.talis@gmail.com> (Gilles
 Talis's message of "Sun, 19 Mar 2017 09:07:52 +0100")
References: <1489910873-8450-1-git-send-email-gilles.talis@gmail.com>
 <1489910873-8450-2-git-send-email-gilles.talis@gmail.com>
Message-ID: <87k27km1jl.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gilles" == Gilles Talis <gilles.talis@gmail.com> writes:

 > Signed-off-by: Gilles Talis <gilles.talis@gmail.com>

 > +config BR2_PACKAGE_LEPTONICA
 > +	bool "leptonica"
 > +	help
 > +	  Leptonica is a pedagogically-oriented open source site containing
 > +	  software that is broadly useful for image processing and image
 > +	  analysis applications.

I know this description is taken verbatim from the upstream site, but it
imho isn't very helpful. This is not a (web)site. What is is really? A
image processing library ans some applications?

-- 
Bye, Peter Korsgaard
