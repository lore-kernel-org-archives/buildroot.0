From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 11 Sep 2016 23:08:30 +0200
Subject: [Buildroot] [PATCH] pugixml: new package
In-Reply-To: <1473262627-14429-2-git-send-email-theo.debrouwere@skynet.be>
References: <20160904210846.1332-1-theo.debrouwere@skynet.be>
 <1473262627-14429-1-git-send-email-theo.debrouwere@skynet.be>
 <1473262627-14429-2-git-send-email-theo.debrouwere@skynet.be>
Message-ID: <20160911230830.0bc783a5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed,  7 Sep 2016 17:37:07 +0200, Theo Debrouwere wrote:
> From: Theo Debrouwere <t.debrouwere@televic.com>
> 
> pugixml is a light-weight C++ XML processing library. It features:
> * DOM-like interface with rich traversal/modification capabilities
> * Extremely fast non-validating XML parser which constructs the DOM tree from an XML file/buffer
> * XPath 1.0 implementation for complex data-driven tree queries
> * Full Unicode support with Unicode interface variants and automatic encoding conversions
> 
> Homepage: http://pugixml.org/
> Repository: https://github.com/zeux/pugixml
> 
> Signed-off-by: Theo Debrouwere <t.debrouwere@televic.com>

This new package is causing a number of build failures. See:

  http://autobuild.buildroot.net/?reason=pugixml-1.7

Could you have a look?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
