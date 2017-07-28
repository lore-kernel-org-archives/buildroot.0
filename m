From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 29 Jul 2017 00:54:37 +0200
Subject: [Buildroot] [PATCH v3] package/libv4l: no libv4lconvert helper
 support if no fork()
In-Reply-To: <1501239707-18765-2-git-send-email-hugues.fruchet@st.com>
References: <1501239707-18765-1-git-send-email-hugues.fruchet@st.com>
 <1501239707-18765-2-git-send-email-hugues.fruchet@st.com>
Message-ID: <925e2f45-5856-d35c-e2aa-985db6b5768c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28-07-17 13:01, Hugues Fruchet wrote:
> Build libv4lconvert helper support only when fork()
> is available.
> 
> Fixes [1]:
>     CXXLD    v4l2-compliance
>    .../build/libv4l-1.12.5/lib/libv4lconvert/.libs/libv4lconvert.so: undefined reference to `fork'
>   collect2: error: ld returned 1 exit status
> 
> [1] http://autobuild.buildroot.net/results/7e8/7e8fbd99a8c091d7bbeedd16066297682bbe29fe
> 
> Signed-off-by: Hugues Fruchet <hugues.fruchet@st.com>
> Tested-by: Peter Seiderer <ps.report@gmx.net>

 Applied to master, thanks.

 Note that for a series of a single patch, there is really no need to have a
cover letter. Also it's more convenient to read the patch history directly in
the patch itself rather than in a separate mail.

 Regards,
 Arnout


[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
