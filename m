From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Nov 2012 22:58:01 +0100
Subject: [Buildroot] [PATCHv2 for-2012.11 2/5] manual: various fixes
In-Reply-To: <CAHXCMMJqkV-M2k8d9Xo1v1YQ8E5oEQobpJHUrSbg=6fUWi4pmQ@mail.gmail.com>
References: <1354046527-13132-1-git-send-email-arnout@mind.be>
 <1354046527-13132-2-git-send-email-arnout@mind.be>
 <CAHXCMMJqkV-M2k8d9Xo1v1YQ8E5oEQobpJHUrSbg=6fUWi4pmQ@mail.gmail.com>
Message-ID: <50B53769.8080504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27/11/12 22:04, Samuel Martin wrote:
>> >    * +LIBFOO_PATCH+ may contain the name of a patch, that will be
>> >      downloaded from the same location as the tarball indicated in
>> >      +LIBFOO_SOURCE+. If +HOST_LIBFOO_PATCH+ is not specified, it
>> >  -  defaults to +LIBFOO_PATCH+. Also note that another mechanism is
>> >  -  available to patch a package: all files of the form
>> >  -  +packagename-packageversion-description.patch+ present in the
>> >  +  defaults to +LIBFOO_PATCH+. Note that patches that are included
>> >  +  in Buildroot itself use a different mechanism: all files of the
>> >  +  form +packagename-packageversion-description.patch+ present in the
> Well, actually the pattern is "packagename-*.patch" in the following
> directories:
> - package/<packagename>/<packagename-packageversion>/ if this
> subdirectory exists;
> - package/<packagename>/ otherwise.

  I think mentioning those two directories goes a bit too far, but I'll
correct the pattern.


  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
