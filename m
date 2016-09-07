From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 07 Sep 2016 22:46:02 +0200
Subject: [Buildroot] [git commit] pugixml: new package
In-Reply-To: <CAHXCMMJ0hQ=_8e0_qs2Kwiew+=4MZbrSUYCQO4e+3aOn8Xgpsw@mail.gmail.com>
 (Samuel Martin's message of "Wed, 7 Sep 2016 22:42:27 +0200")
References: <20160907194629.362D3820FA@busybox.osuosl.org>
 <CAHXCMMJ0hQ=_8e0_qs2Kwiew+=4MZbrSUYCQO4e+3aOn8Xgpsw@mail.gmail.com>
Message-ID: <87d1kf8mlx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Samuel" == Samuel Martin <s.martin49@gmail.com> writes:

 > On Wed, Sep 7, 2016 at 9:36 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
 >> commit: https://git.buildroot.net/buildroot/commit/?id=27071be0d8c648a6f7ec314c29f5b3a033e1208a
 >> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
 >> 
 >> pugixml is a light-weight C++ XML processing library. It features:
 >> * DOM-like interface with rich traversal/modification capabilities
 >> * Extremely fast non-validating XML parser which constructs the DOM tree from an XML file/buffer
 >> * XPath 1.0 implementation for complex data-driven tree queries
 >> * Full Unicode support with Unicode interface variants and automatic encoding conversions
 >> 
 >> Homepage: http://pugixml.org/
 >> Repository: https://github.com/zeux/pugixml
 >> 
 >> Signed-off-by: Theo Debrouwere <t.debrouwere@televic.com>
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > he! You were too quick ;)

Gaah :/

 > Here, the comment about the toolchain dependency is missing :-/ (see
 > sections 17.2.3 and 17.2.4 of the manual [1])

 > [1] http://nightly.buildroot.org/manual.html#_config_files

Ahh yes, I've pushed a fix - Thanks!

-- 
Venlig hilsen,
Peter Korsgaard 
