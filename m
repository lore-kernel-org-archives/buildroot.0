From: Theo Debrouwere <theo.debrouwere@skynet.be>
Date: Wed,  7 Sep 2016 17:37:06 +0200
Subject: [Buildroot] pugixml: new package
In-Reply-To: <20160904210846.1332-1-theo.debrouwere@skynet.be>
References: <20160904210846.1332-1-theo.debrouwere@skynet.be>
Message-ID: <1473262627-14429-1-git-send-email-theo.debrouwere@skynet.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I've fixed the remarks, except:

LIBPUGIXML_SUBDIR = scripts

The location of the current release is inside a subfolder.
This has been fixed in the git tree, but isn't present in the release itself.

Theo
