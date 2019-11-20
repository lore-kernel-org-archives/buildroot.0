From: Thomas Preston <thomas.preston@codethink.co.uk>
Date: Wed, 20 Nov 2019 17:52:20 +0000
Subject: [Buildroot] [RFC PATCH v3 11/30] package/libcef: New package
In-Reply-To: <20191120173944.130142-12-thomas.preston@codethink.co.uk>
References: <20191120173944.130142-1-thomas.preston@codethink.co.uk>
 <20191120173944.130142-12-thomas.preston@codethink.co.uk>
Message-ID: <53f25561-b3f6-5a01-9d61-31574d095dc2@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/11/2019 17:39, Thomas Preston wrote:
> From: Michael Drake <michael.drake@codethink.co.uk>
> 
> Unfortunately, the libcef project does not make release tarballs
> (or tags), so it is fetched from a git repository with a specific
> SHA1 version.
> 

This is incorrect, we actually do use the release tarballs via the
bitbucket auto-archive feature.
