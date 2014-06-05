From: Dan Pattison <dan.pattison@ethertek.ca>
Date: Thu, 05 Jun 2014 12:27:24 -0700
Subject: [Buildroot] Build Output
Message-ID: <5390C49C.9080209@ethertek.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am using the post image script feature to compile and install various 
custom packages. In my shell and make files I want to make the ouput 
show the various stages of package installation like buildroot does with 
text that has a highlighted back ground. This helps in debugging to see 
where certain programs start their build process.

For instance, when the post-image script fires it outputs the line below 
with a highlighted back ground that is easy to spot.
 >>>   Executing post-image script board/ethertek/ws/post-build.sh

I tried the line below in my own post-build.sh, but get a command not 
found error.
$(call MESSAGE,"Building Package FOO");

Is it possible to make the call command above work in my own shell 
scripts that reside in the board folder? If yes, what do I include to 
make that work?

Thank you,

-- 
Dan Pattison
Ethertek Circuits
