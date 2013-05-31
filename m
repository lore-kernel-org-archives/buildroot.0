From: this_thread <chrisddail@gmail.com>
Date: Fri, 31 May 2013 08:46:13 -0700 (PDT)
Subject: [Buildroot]  Installing package to custom location
Message-ID: <35575784.post@talk.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Is it possible to use buildroot to install individual packages to a custom
location (rather than installing to the target?)  I have several packages I
want to install to my target, and several others that I'd like to be made
available to individual users on an as-needed basis.  Is it possible to use
Buildroot to specify some alternate install location, giving each package
it's own directory, or would I just need to cross-compile them using the
toolchain individually?
-- 
View this message in context: http://old.nabble.com/Installing-package-to-custom-location-tp35575784p35575784.html
Sent from the BuildRoot mailing list archive at Nabble.com.
